defmodule Corinth.AttachmentsTest do
  use Corinth.DataCase

  alias Corinth.Attachments

  describe "text_attachments" do
    alias Corinth.Attachments.TextAttachment

    import Corinth.AttachmentsFixtures

    @invalid_attrs %{content: nil}

    test "list_text_attachments/0 returns all text_attachments" do
      text_attachment = text_attachment_fixture()
      assert Attachments.list_text_attachments() == [text_attachment]
    end

    test "get_text_attachment!/1 returns the text_attachment with given id" do
      text_attachment = text_attachment_fixture()
      assert Attachments.get_text_attachment!(text_attachment.id) == text_attachment
    end

    test "create_text_attachment/1 with valid data creates a text_attachment" do
      valid_attrs = %{content: "some content"}

      assert {:ok, %TextAttachment{} = text_attachment} = Attachments.create_text_attachment(valid_attrs)
      assert text_attachment.content == "some content"
    end

    test "create_text_attachment/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Attachments.create_text_attachment(@invalid_attrs)
    end

    test "update_text_attachment/2 with valid data updates the text_attachment" do
      text_attachment = text_attachment_fixture()
      update_attrs = %{content: "some updated content"}

      assert {:ok, %TextAttachment{} = text_attachment} = Attachments.update_text_attachment(text_attachment, update_attrs)
      assert text_attachment.content == "some updated content"
    end

    test "update_text_attachment/2 with invalid data returns error changeset" do
      text_attachment = text_attachment_fixture()
      assert {:error, %Ecto.Changeset{}} = Attachments.update_text_attachment(text_attachment, @invalid_attrs)
      assert text_attachment == Attachments.get_text_attachment!(text_attachment.id)
    end

    test "delete_text_attachment/1 deletes the text_attachment" do
      text_attachment = text_attachment_fixture()
      assert {:ok, %TextAttachment{}} = Attachments.delete_text_attachment(text_attachment)
      assert_raise Ecto.NoResultsError, fn -> Attachments.get_text_attachment!(text_attachment.id) end
    end

    test "change_text_attachment/1 returns a text_attachment changeset" do
      text_attachment = text_attachment_fixture()
      assert %Ecto.Changeset{} = Attachments.change_text_attachment(text_attachment)
    end
  end

  describe "url_attachments" do
    alias Corinth.Attachments.UrlAttachment

    import Corinth.AttachmentsFixtures

    @invalid_attrs %{url: nil}

    test "list_url_attachments/0 returns all url_attachments" do
      url_attachment = url_attachment_fixture()
      assert Attachments.list_url_attachments() == [url_attachment]
    end

    test "get_url_attachment!/1 returns the url_attachment with given id" do
      url_attachment = url_attachment_fixture()
      assert Attachments.get_url_attachment!(url_attachment.id) == url_attachment
    end

    test "create_url_attachment/1 with valid data creates a url_attachment" do
      valid_attrs = %{url: "some url"}

      assert {:ok, %UrlAttachment{} = url_attachment} = Attachments.create_url_attachment(valid_attrs)
      assert url_attachment.url == "some url"
    end

    test "create_url_attachment/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Attachments.create_url_attachment(@invalid_attrs)
    end

    test "update_url_attachment/2 with valid data updates the url_attachment" do
      url_attachment = url_attachment_fixture()
      update_attrs = %{url: "some updated url"}

      assert {:ok, %UrlAttachment{} = url_attachment} = Attachments.update_url_attachment(url_attachment, update_attrs)
      assert url_attachment.url == "some updated url"
    end

    test "update_url_attachment/2 with invalid data returns error changeset" do
      url_attachment = url_attachment_fixture()
      assert {:error, %Ecto.Changeset{}} = Attachments.update_url_attachment(url_attachment, @invalid_attrs)
      assert url_attachment == Attachments.get_url_attachment!(url_attachment.id)
    end

    test "delete_url_attachment/1 deletes the url_attachment" do
      url_attachment = url_attachment_fixture()
      assert {:ok, %UrlAttachment{}} = Attachments.delete_url_attachment(url_attachment)
      assert_raise Ecto.NoResultsError, fn -> Attachments.get_url_attachment!(url_attachment.id) end
    end

    test "change_url_attachment/1 returns a url_attachment changeset" do
      url_attachment = url_attachment_fixture()
      assert %Ecto.Changeset{} = Attachments.change_url_attachment(url_attachment)
    end
  end

  describe "file_attachments" do
    alias Corinth.Attachments.FileAttachment

    import Corinth.AttachmentsFixtures

    @invalid_attrs %{location: nil}

    test "list_file_attachments/0 returns all file_attachments" do
      file_attachment = file_attachment_fixture()
      assert Attachments.list_file_attachments() == [file_attachment]
    end

    test "get_file_attachment!/1 returns the file_attachment with given id" do
      file_attachment = file_attachment_fixture()
      assert Attachments.get_file_attachment!(file_attachment.id) == file_attachment
    end

    test "create_file_attachment/1 with valid data creates a file_attachment" do
      valid_attrs = %{location: "some location"}

      assert {:ok, %FileAttachment{} = file_attachment} = Attachments.create_file_attachment(valid_attrs)
      assert file_attachment.location == "some location"
    end

    test "create_file_attachment/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Attachments.create_file_attachment(@invalid_attrs)
    end

    test "update_file_attachment/2 with valid data updates the file_attachment" do
      file_attachment = file_attachment_fixture()
      update_attrs = %{location: "some updated location"}

      assert {:ok, %FileAttachment{} = file_attachment} = Attachments.update_file_attachment(file_attachment, update_attrs)
      assert file_attachment.location == "some updated location"
    end

    test "update_file_attachment/2 with invalid data returns error changeset" do
      file_attachment = file_attachment_fixture()
      assert {:error, %Ecto.Changeset{}} = Attachments.update_file_attachment(file_attachment, @invalid_attrs)
      assert file_attachment == Attachments.get_file_attachment!(file_attachment.id)
    end

    test "delete_file_attachment/1 deletes the file_attachment" do
      file_attachment = file_attachment_fixture()
      assert {:ok, %FileAttachment{}} = Attachments.delete_file_attachment(file_attachment)
      assert_raise Ecto.NoResultsError, fn -> Attachments.get_file_attachment!(file_attachment.id) end
    end

    test "change_file_attachment/1 returns a file_attachment changeset" do
      file_attachment = file_attachment_fixture()
      assert %Ecto.Changeset{} = Attachments.change_file_attachment(file_attachment)
    end
  end
end
